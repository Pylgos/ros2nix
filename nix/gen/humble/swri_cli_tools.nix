{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  marti_introspection_msgs,
  rcl_interfaces,
  rclpy,
  ros2cli,
  substituteSource,
}:
let
  sources = rec {
    swri_cli_tools = substituteSource {
      src = fetchgit {
        name = "swri_cli_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "96ad9bbb6c616cc6372e7c0012e11ceee09131ba";
        hash = "sha256-QwxRWoZHoEeWtgjiih1KGtL4z0gAytUMI9yLK2eIJ6Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_cli_tools";
  version = "3.6.1-1";
  src = sources.swri_cli_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ marti_introspection_msgs rcl_interfaces rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
