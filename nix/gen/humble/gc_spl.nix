{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gc_spl_interfaces,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    gc_spl = substituteSource {
      src = fetchgit {
        name = "gc_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "355e02f1f360fbb5abe9604378aaa6ecd2b8c415";
        hash = "sha256-47m33p9yTzG4VYjZTR3cVmRKmTGiqnR3jSHgH58wztQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl";
  version = "2.1.0-1";
  src = sources.gc_spl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gc_spl_interfaces python3Packages.construct rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
