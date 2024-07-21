{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  console-bridge,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  tinyxml2_vendor,
  urdf,
  urdfdom_headers,
  urdfdom_py,
}:
let
  sources = rec {
    srdfdom = substituteSource {
      src = fetchgit {
        name = "srdfdom-source";
        url = "https://github.com/ros2-gbp/srdfdom-release.git";
        rev = "6817f4b07d5c39f06de2a713efb0b3264e8cb10c";
        hash = "sha256-4SrjgL5tauV2LvLisilSnXwyD2qTdhVdYDtH8D/69yg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "srdfdom";
  version = "2.0.4-4";
  src = sources.srdfdom;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ python3Packages.boost urdfdom_headers ];
  propagatedBuildInputs = [ console-bridge console_bridge_vendor tinyxml2_vendor urdf urdfdom_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}