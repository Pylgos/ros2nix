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
        rev = "3192114c9aa0f21b6753e6de98990d2fc3942601";
        hash = "sha256-+JVChj8V5o/ami/f0h5aFvmiBgphRScf8UBOKJt5FWg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_interface_files";
  version = "0.12.0-1";
  src = sources.test_interface_files;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}