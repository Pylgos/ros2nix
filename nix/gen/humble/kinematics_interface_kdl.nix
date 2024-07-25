{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  kdl_parser,
  kinematics_interface,
  pluginlib,
  ros2_control_test_assets,
  substituteSource,
  tf2_eigen_kdl,
}:
let
  sources = rec {
    kinematics_interface_kdl = substituteSource {
      src = fetchgit {
        name = "kinematics_interface_kdl-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "c355115df7149fa6f5abf8cf6301e2e34d02f4b3";
        hash = "sha256-OQOA5Q1EnTKe/veCDJuPfVaxh4j2lLVO4PsD8BwZVhI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kinematics_interface_kdl";
  version = "0.3.0-1";
  src = sources.kinematics_interface_kdl;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen kdl_parser kinematics_interface pluginlib tf2_eigen_kdl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
