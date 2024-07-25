{
  ament_cmake_ros,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rcl,
  rclc,
  rclc_lifecycle,
  rclc_parameter,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclc_examples = substituteSource {
      src = fetchgit {
        name = "rclc_examples-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "483f76e7a84ec539e9c4368004b61ead3ebd246f";
        hash = "sha256-TsAGu1G+m5B8snTdjyHUbAdQlSteb//PfJ7b06ezjyE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_examples";
  version = "5.0.1-1";
  src = sources.rclc_examples;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces lifecycle_msgs rcl rclc rclc_lifecycle rclc_parameter std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
