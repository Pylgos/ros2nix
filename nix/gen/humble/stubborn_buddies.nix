{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rcutils,
  std_msgs,
  stubborn_buddies_msgs,
  substituteSource,
}:
let
  sources = rec {
    stubborn_buddies = substituteSource {
      src = fetchgit {
        name = "stubborn_buddies-source";
        url = "https://github.com/ros2-gbp/stubborn_buddies-release.git";
        rev = "3a57d99c24c5c430c9c76a32585eb7817f1fab25";
        hash = "sha256-gR08XIszXNwbw343ie74jForyMoXvqCbhynmzAN+Y/w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stubborn_buddies";
  version = "1.0.0-5";
  src = sources.stubborn_buddies;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rclcpp_lifecycle rcutils std_msgs stubborn_buddies_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
