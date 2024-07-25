{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    launch_yaml = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "0a42049e3fb294c51f2ed687ccbdf7a4223c5a1b";
        hash = "sha256-T5r6Y1xvShrUwp0kfDsRKhBNi9HJf+8gpDozmrw+Wr8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_yaml";
  version = "1.0.6-1";
  src = sources.launch_yaml;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
