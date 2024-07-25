{
  ament_cmake,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rot_conv = substituteSource {
      src = fetchgit {
        name = "rot_conv-source";
        url = "https://github.com/ros2-gbp/rot_conv_lib-release.git";
        rev = "5adfe6e442c99c0fc3bf5aae450b13c1f247ec4c";
        hash = "sha256-c4R7JJBhVCoKePjYG5ZlQAUB8iKpfTqSJogg5May3jo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rot_conv";
  version = "1.0.12-2";
  src = sources.rot_conv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
