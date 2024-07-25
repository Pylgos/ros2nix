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
        rev = "d0ddd7090299e091b34b628d908e306c39e64769";
        hash = "sha256-PULIJQT9JZzidgOHXZQ+4TUWyn7QggX+Nb/ozhHxU9g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "r2r_spl_7";
  version = "2.1.0-1";
  src = sources.r2r_spl_7;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy splsm_7_conversion ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
