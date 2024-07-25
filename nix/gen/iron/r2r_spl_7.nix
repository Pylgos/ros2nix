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
  splsm_7_conversion,
  substituteSource,
}:
let
  sources = rec {
    r2r_spl_7 = substituteSource {
      src = fetchgit {
        name = "r2r_spl_7-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "68826615f0eac4307234047ef5be94bbd7dbbc58";
        hash = "sha256-doyU3mxzfOv+kVnm70lOdxa+u7+egjao0YbEps0qlcY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "r2r_spl_7";
  version = "3.1.0-1";
  src = sources.r2r_spl_7;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy splsm_7_conversion ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
