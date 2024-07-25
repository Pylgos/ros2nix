{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    domain_coordinator = substituteSource {
      src = fetchgit {
        name = "domain_coordinator-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "a4d43c5a4862a6257d19702b6637d417abea5a18";
        hash = "sha256-2Jhr/k/50dDdybVClohkfUC6hF4CvcM9Hb+aaZSwz4I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "domain_coordinator";
  version = "0.10.0-3";
  src = sources.domain_coordinator;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
