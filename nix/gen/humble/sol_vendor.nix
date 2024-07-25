{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ouxt_lint_common,
  substituteSource,
}:
let
  sources = rec {
    sol_vendor = substituteSource {
      src = fetchgit {
        name = "sol_vendor-source";
        url = "https://github.com/ros2-gbp/sol_vendor-release.git";
        rev = "34403351a738af172b80f4b644b34cd25272ff60";
        hash = "sha256-OJUnC0ys2Skzp15ABwTAk6kvOh0Q0tOfO3vQ9jmhxa4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ThePhD/sol2.git";
          to = "URL ${sol_vendor-vendor_source-sol2-0}";
        }
      ];
    };
    sol_vendor-vendor_source-sol2-0 = substituteSource {
      src = fetchgit {
        name = "sol_vendor-vendor_source-sol2-0-source";
        url = "https://github.com/ThePhD/sol2.git";
        rev = "dca62a0f02bb45f3de296de3ce00b1275eb34c25";
        hash = "sha256-7QHZRudxq3hdsfEAYKKJydc4rv6lyN6UIt/2Zmaejx8=";
      };
      substitutions = [
        {
          path = "cmake/Packages/FindLuaBuild/LuaJIT.cmake";
          from = "URL \"\${LUA_JIT_DOWNLOAD_URI}\"";
          to = "URL ${sol_vendor-vendor_source-sol2-0-vendor_source-LuaJIT-2-0}";
        }
      ];
    };
    sol_vendor-vendor_source-sol2-0-vendor_source-LuaJIT-2-0 = substituteSource {
      src = fetchzip {
        name = "sol_vendor-vendor_source-sol2-0-vendor_source-LuaJIT-2-0-source";
        url = "http://luajit.org/download/LuaJIT-2.1.0-beta3.tar.gz";
        hash = "sha256-kX55QnUEqYcDVi0F05iO3WwKGMPlWaPZ7qHAGH84AEg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sol_vendor";
  version = "0.0.3-3";
  src = sources.sol_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
