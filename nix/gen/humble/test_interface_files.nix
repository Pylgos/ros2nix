{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    test_interface_files = substituteSource {
      src = fetchgit {
        name = "test_interface_files-source";
        url = "https://github.com/ros2-gbp/test_interface_files-release.git";
        rev = "e3d0c4e82b4ae8f07faa3c45d235a70313fb2e38";
        hash = "sha256-QNZlkUZcUAHAOEUnh0h7Ba8nKb7O6zH6wj36lqQKQSo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_interface_files";
  version = "0.9.1-2";
  src = sources.test_interface_files;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
