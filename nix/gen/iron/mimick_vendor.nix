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
        rev = "8ca750d86d7a603a9124811d8b7274ca4aaa3c3c";
        hash = "sha256-BywBtl3cnILFGiu7AzkegR/NGcKIY3b2dMwZA0zpUYE=";
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
  version = "0.3.2-5";
  src = sources.mimick_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
