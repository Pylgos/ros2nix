{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_2d_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    social_nav_msgs = substituteSource {
      src = fetchgit {
        name = "social_nav_msgs-source";
        url = "https://github.com/ros2-gbp/social_nav_ros-release.git";
        rev = "2f1f313f2eff65f498fb53843122672fffb12d76";
        hash = "sha256-UgjecuJTo078mKAyGtgqCQ3sIczwiZBlVuiS/7MvYLg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "social_nav_msgs";
  version = "0.1.0-1";
  src = sources.social_nav_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_2d_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
