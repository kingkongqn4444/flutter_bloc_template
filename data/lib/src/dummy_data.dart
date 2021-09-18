

class DummyData {
//  static String getNewsImageUrl() {
//    final List<String> images = [
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/20/pic-1-tham-nha-mau-1616202261-8305-1616202535.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=7tweVpDik9Iy8U4omjiMMg',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/image003-5221-1616053000.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=ns52J3_GVMtB1QEE41ognw',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/19/609-1615973109-2694-1616127983.png?w=680&h=0&q=100&dpr=2&fit=crop&s=Ol35hG8LQc19ARqGz8l5BQ',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/19/196-1615973099-4842-1616127984.png?w=680&h=0&q=100&dpr=2&fit=crop&s=373NVsbrVRL6C1wVs2cz8g',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/19/h1-1608362518-2459-1608368047-4464-1616128354.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=AI6xgabt_3dgoMPG_N-fCw',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/19/anh-2-1-3822-1616124210.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=A-1Z31bob1lkjTXAgia8ng',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/19/anh-3-9067-1616124210.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=dfVfei2ZjmnzJrAnnmS3DA',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/19/nv2-5089-1616117922.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=DbDx9bUcqfPVtlG1js5nig',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/19/image001-8906-1616116553.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=fTDfXWzC8ChVYjWE-mEI3Q',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/19/image002-6021-1616116553.png?w=680&h=0&q=100&dpr=2&fit=crop&s=ZLWNShAaII5HNQP34zvzSg',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/image003-2145-1616049872.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=HlEndxlMOwTHZ1lyFE4Z4Q',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/image002-5621-1616049872.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=WP4l0XgxBHKXveG3aSGwmA',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/Ixora-Ho-Tram-by-Fusion-Condot-9537-5470-1616057029.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=OCR4oSOHLdtGs2dUcKsvoA',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/Ixora-Ho-Tram-by-Fusion-Villa-8641-2900-1616057029.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=axjWeN56RVBGoGda2oapAQ',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/17/21-9-5-jpeg-4049-1615967315.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=mh43VtU42vGqwKNPye3SDw',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/17/image002-5757-1615967315.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=lFB7rPIxIuQWvSli7p_vjA',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/image003-1262-1616054755.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=B3ydniHGMtl7IzwFBfsRYQ',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/0efce7272a90d9ce8081-7999-1616054755.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=HpIuXnBac7uK70zt0FwMWw',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/17/316-1615976962-8889-1615979340.png?w=680&h=0&q=100&dpr=2&fit=crop&s=nPJOY4NNx57Tw1wWxi5xVQ',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/17/584-1615976970-4382-1615979340.png?w=680&h=0&q=100&dpr=2&fit=crop&s=UfaxHHtnr-ujEhNm-rtNeA',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/opb-b1-h1-1616045928-5449-1616045964.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=DimJyHU_h1Ab-a2vkWKcmA',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/masteri-5784-1616039497.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=4ZswW_NmqsoEOWoENvg5aA',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/17/anh-2-yoko-villas-thoa-man-kha-7876-9193-1615967622.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=G1qAFbTP9tzC0lX2fUIxnQ',
//      'https://i1-kinhdoanh.vnecdn.net/2021/03/18/m1-4658-1616032408-1616033067-4069-1616033097.png?w=680&h=0&q=100&dpr=2&fit=crop&s=xMb2WwrRhuI53y5MN4fPxg',
//    ];
//
//    return images.elementAt(new Random().nextInt(images.length));
//  }
}
