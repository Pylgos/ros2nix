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
        rev = "1f2792150508b7ca7466a5d52259745576433125";
        hash = "sha256-e3NIWLIg07dDc58jQLmn7L5C8AXWIzYNfagXnmNGiQk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_interface_files";
  version = "0.10.2-3";
  src = sources.test_interface_files;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
