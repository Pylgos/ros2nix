{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    kortex_api = substituteSource {
      src = fetchgit {
        name = "kortex_api-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "837f62c5aa4ce88f7f742683c2692c388146b061";
        hash = "sha256-UFMEHMDlJ46OSmSxOWPLgoOcCND8kWd+9gzBtSJQCXw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
          to = "URL ${kortex_driver-vendor_source-linux_x86-64_x86_gcc-0}";
        }
      ];
    };
    kortex_driver-vendor_source-linux_x86-64_x86_gcc-0 = substituteSource {
      src = fetchzip {
        name = "kortex_driver-vendor_source-linux_x86-64_x86_gcc-0-source";
        url = "https://artifactory.kinovaapps.com:443/artifactory/generic-public/kortex/API/2.5.0/linux_x86-64_x86_gcc.zip";
        hash = "sha256-+fUMtXCoThItleO1C2jTZfK6DP/Z7dVJx26WWbBQ9Uc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kortex_api";
  version = "0.2.2-1";
  src = sources.kortex_api;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}