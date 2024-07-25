{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  ament_vitis,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  opencl-headers,
  substituteSource,
}:
let
  sources = rec {
    vitis_common = substituteSource {
      src = fetchgit {
        name = "vitis_common-source";
        url = "https://github.com/ros2-gbp/vitis_common-release.git";
        rev = "7ffecd62b7f4db22fd91b4496843b844ebcd8742";
        hash = "sha256-K6BliyL56las1cA019YmPWtcy/bVEejNPaYTF7SVYic=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vitis_common";
  version = "0.4.2-2";
  src = sources.vitis_common;
  nativeBuildInputs = [ ament_cmake ament_vitis ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencl-headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
