# MT607
AVX-512 trials for mersenne twister

# mt607.cpp
状態空間がレジスタ数本に入り切るぐらいのものを書いてみようと思い、メルセンヌ数が607のものを選びました。
32-bitで19語 （607 = 512 + 96 - 1）なので、zmmレジスタ1本とちょっとになります。
係数は[MTToolBox](https://github.com/MSaito/MTToolBox)のDCMTで生成したものを使っています。
pos=2かpos=3のときでしかAVX−512でのSIMD化はできません。pos=3だとvalignd命令がひとつ少なくて済むので
`MTToolBox/DCMT/mt2`の出力からpos=3の結果を選んで使っています。
posを固定して係数を生成する方法、どなたかご存知ではないでしょうか？

なお、SIMD化前後で同じ値になることの確認はしてありますが、SIMD化前の実装も私の手書きのため正しいものである保証はありません。ご了承ください。

# mt19937ar-cok.c
[公式ページ](http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/MT2002/mt19937ar.html)で配布されているものにAVX-512での状態一括更新を加えてみたものです。
オリジナルでは状態の型が`unsigned long`だったのですが、さすがにLP64の環境では使い難いのでこの部分は`uint32_t`に置き換えてあります。
最も標準的なパラメタのmt19937_32のSIMD化となっています。

しかし状態更新だけSIMD化してもtemperingの方が重そうですね。
しかしこの部分をSIMD化してキャッシュしておくのに624 int32 = 39 zmm = 2496 byteものメモリを消費してもよいものか。
この1/3の208 int32 = 13 zmm = 832 byteぐらいなら許されるのかもしれません。
