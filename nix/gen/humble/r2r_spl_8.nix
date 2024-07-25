{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  splsm_8_conversion,
  substituteSource,
}:
let
  sources = rec {
    r2r_spl_8 = substituteSource {
      src = fetchgit {
        name = "r2r_spl_8-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "e12a8ebc320c23340a7f8b8e17def9cf9b741447";
        hash = "sha256-e8OpqJ2Rwci2mKW+H9SWoUnOyPpZzRmprV6QdMUekWE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "r2r_spl_8";
  version = "2.1.0-1";
  src = sources.r2r_spl_8;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy splsm_8_conversion ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
