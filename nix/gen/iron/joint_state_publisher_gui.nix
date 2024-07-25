{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  python_qt_binding,
  rclpy,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    joint_state_publisher_gui = substituteSource {
      src = fetchgit {
        name = "joint_state_publisher_gui-source";
        url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
        rev = "c1de8699fc5083f25170567313c5cf4efaf6a819";
        hash = "sha256-ZumKM1KrbYTFo3f4tigUBtyVcxNOVbG2+FR7x85ZLhM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_state_publisher_gui";
  version = "2.4.0-1";
  src = sources.joint_state_publisher_gui;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher python_qt_binding rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
