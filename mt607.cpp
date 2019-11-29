#include <cstdint>
#include <cstdio>
#include <cassert>
#include <x86intrin.h>

// 607,96,3,a8f80060,8f7777c0,ed6a0000,205

struct MT607{
	enum{
		// 607 = 19*32 - 1
		size = 19,
		r    = 1,
		pos  = 3,
	};
	static const uint32_t umask = (~0u) << r;
	static const uint32_t lmask = ~umask;

	uint32_t state[size];
	int index;

	uint32_t &at(int i) {
		return state[i % size];
	}

	uint32_t amat, bmask, cmask;
	MT607(){
		amat  = 0xa8f80060;
		bmask = 0x8f7777c0;
		cmask = 0xed6a0000;

		for(int i=0; i<size; i++){
			state[i] = -(i + 1);
		}

		index = -1;
	}

	uint32_t generate(){
		index++;
		index %= size;

		uint32_t x0 = at(index + 0);
		uint32_t x1 = at(index + 1);
		uint32_t xp = at(index + pos);


		uint32_t xs = (x0&umask) | (x1&lmask);
		xs = xp ^ (xs >> 1) ^ (xs&1 ? amat : 0);

		at(index + 0) = xs;

		// temperament
		uint32_t y = xs;
		y ^= (y >> 12);
		y ^= (y <<  7) & bmask;
		y ^= (y << 15) & cmask;
		y ^= (y >> 18);

		return y;
	}
};

struct MT607_avx512{
	enum{
		// 607 = 19*32 - 1
		size = 19,
		r    = 1,
		pos  = 3,

	};
	static_assert(size-pos >= 16, "");

	static const uint32_t umask = (~0u) << r;
	static const uint32_t lmask = ~umask;
	static const uint32_t amat  = 0xa8f80060;
	static const uint32_t bmask = 0x8f7777c0;
	static const uint32_t cmask = 0xed6a0000;

	__m512i sv0, sv1; // state vector

	MT607_avx512(){
#if 0
		uint32_t buf[16 + size] = {0, };
		uint32_t *state = buf + 16;
		for(int i=0; i<size; i++){
			state[i] = -(i + 1);
		}
		sv0 = _mm512_loadu_si512(state +  3 - 16);
		sv1 = _mm512_loadu_si512(state +  3);
#else
		uint32_t state[size];
		for(int i=0; i<size; i++){
			state[i] = -(i + 1);
		}
		load_status(state);
#endif
	}
	void load_status(uint32_t st[19]){ // older to younger
#if 0
		__mmask16 k = 7 << 13;
		sv0 = _mm512_mask_loadu_epi32(sv0, k, st-13);
#else
		__m512i tmp = _mm512_loadu_si512(st);
		sv0 = _mm512_alignr_epi32(tmp, tmp, 3);
#endif
		sv1 = _mm512_loadu_si512(st+3);
	}

	__m512i generate(){
		const __m512i x0 = _mm512_alignr_epi32(sv1, sv0, 13);
		const __m512i x1 = _mm512_alignr_epi32(sv1, sv0, 14);
		const __m512i x2 = sv1;


		__m512i sv2 = _mm512_or_epi32(
				_mm512_and_epi32(x0, _mm512_set1_epi32(umask)),
				_mm512_and_epi32(x1, _mm512_set1_epi32(lmask)));

		__m512i sr1  = _mm512_srli_epi32(sv2, 1);
		__m512i sl31 = _mm512_slli_epi32(sv2, 31);
		// move LSBs to MSBs, and then the mask register
		__mmask16 mask = _mm512_movepi32_mask (sl31);
		sv2 = _mm512_mask_xor_epi32(sr1, mask, sr1, _mm512_set1_epi32(amat));
		
		sv2 = _mm512_xor_epi32(sv2, x2);

		sv0 = sv1;
		sv1 = sv2;

		// tempering
		__m512i y = sv2;

		y = _mm512_xor_epi32(y, _mm512_srli_epi32(y, 12));

		y = _mm512_xor_epi32(y, _mm512_and_epi32(_mm512_slli_epi32(y,  7), _mm512_set1_epi32(bmask)));

		y = _mm512_xor_epi32(y, _mm512_and_epi32(_mm512_slli_epi32(y, 15), _mm512_set1_epi32(cmask)));

		y = _mm512_xor_epi32(y, _mm512_srli_epi32(y, 18));

		return y;
	}
};

extern "C" void trash(...){
	asm volatile ("ret");
}

#ifdef __GNUC__
#define _mm512_storeu_epi32 _mm512_store_epi32
#endif

int main(){
	MT607 mt;
	for(int i=0; i<32; i++){
		auto r = mt.generate();
		printf("%2i : %08x\n", i, r);
	}

	puts("");

	MT607_avx512 mta;
	for(int i=0; i<32; i+=16){
		uint32_t buf[16];
		__m512i val = mta.generate();
		_mm512_storeu_epi32(buf, val);
		for(int j=0; j<16; j++){
			printf("%2i : %08x\n", i+j, buf[j]);
		}
	}

	for(int k=0; k<100; k++){
		uint32_t buf[16];
		__m512i val = mta.generate();
		_mm512_storeu_epi32(buf, val);
		for(int j=0; j<16; j++){
			assert(buf[j] == mt.generate());
		}
		printf("%d ", k);
	}
	puts("");

	// benchmark
	asm volatile ("#begin");
	__m512i sum = _mm512_set1_epi32(0);
	for(int k=0; k<100; k++){
		sum = _mm512_add_epi32(sum, mta.generate());
	}
	asm volatile ("#end");
	printf("%A\n", sum);


	return 0;
}
