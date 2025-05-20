// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "freetype",
    products: [
        .library(
            name: "freetype",
            targets: ["freetype"]
        ),
    ],
    targets: [
        .target(
            name: "freetype",
            sources: [
                "src/autofit/autofit.c",
                "src/base/ftbase.c",
                "src/base/ftbbox.c",
                "src/base/ftbdf.c",
                "src/base/ftbitmap.c",
                "src/base/ftcid.c",
                "src/base/ftfstype.c",
                "src/base/ftgasp.c",
                "src/base/ftglyph.c",
                "src/base/ftgxval.c",
                "src/base/ftinit.c",
                "src/base/ftmm.c",
                "src/base/ftotval.c",
                "src/base/ftpatent.c",
                "src/base/ftpfr.c",
                "src/base/ftstroke.c",
                "src/base/ftsynth.c",
                "src/base/fttype1.c",
                "src/base/ftwinfnt.c",
                "src/bdf/bdf.c",
                "src/bzip2/ftbzip2.c",
                "src/cache/ftcache.c",
                "src/cff/cff.c",
                "src/cid/type1cid.c",
                "src/gzip/ftgzip.c",
                "src/lzw/ftlzw.c",
                "src/pcf/pcf.c",
                "src/pfr/pfr.c",
                "src/psaux/psaux.c",
                "src/pshinter/pshinter.c",
                "src/psnames/psnames.c",
                "src/raster/raster.c",
                "src/sdf/sdf.c",
                "src/sfnt/sfnt.c",
                "src/smooth/smooth.c",
                "src/svg/svg.c",
                "src/truetype/truetype.c",
                "src/type1/type1.c",
                "src/type42/type42.c",
                "src/winfonts/winfnt.c",
                ftSystem,
                ftDebug
            ],
            publicHeadersPath: "include",
            cSettings: [
                .define("FT2_BUILD_LIBRARY"),
                .define("FT_CONFIG_CONFIG_H", to: "<freetype/config/ftconfig.h>"),
                .define("FT_CONFIG_OPTIONS_H", to: "<freetype/config/ftoption.h>"),
                .define("HAVE_UNISTD_H", to: "1", .when(platforms: [.macOS, .linux])),
                .define("HAVE_FCNTL_H", to: "1", .when(platforms: [.macOS, .linux])),
            ]
        ),
    ]
)

// MARK: - Platform-specific sources

var ftSystem: String {
#if os(macOS)
    "builds/unix/ftsystem.c"
#elseif os(Linux)
    "src/base/ftsystem.c"
#elseif os(Windows)
    "builds/windows/ftsystem.c"
#endif
}

var ftDebug: String {
#if os(Windows)
    "builds/windows/ftdebug.c"
#else
    "src/base/ftdebug.c"
#endif
}
