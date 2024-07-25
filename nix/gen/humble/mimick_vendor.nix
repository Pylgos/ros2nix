{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
}:
let
  sources = rec {
    mimick_vendor = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-source";
        url = "https://github.com/ros2-gbp/mimick_vendor-release.git";
        rev = "c2c7cccbfa6551d7fc2bc10a126313e45c963c0b";
        hash = "sha256-sbNAgZZ3wA7YkE29bq92nb4sQVmKXyHozHQdf4kutK4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ros2/Mimick.git";
          to = "URL ${mimick_vendor-vendor_source-Mimick-0}";
        }
      ];
    };
    mimick_vendor-vendor_source-Mimick-0 = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-vendor_source-Mimick-0-source";
        url = "https://github.com/ros2/Mimick.git";
        rev = "de11f8377eb95f932a03707b583bf3d4ce5bd3e7";
        hash = "sha256-adCxIl0F3QkgSimOhvuTyhmig1rFy/K9wxZ/+YCuxYo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mimick_vendor";
  version = "0.2.8-2";
  src = sources.mimick_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
