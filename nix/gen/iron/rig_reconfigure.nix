{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  glfw3,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    rig_reconfigure = substituteSource {
      src = fetchgit {
        name = "rig_reconfigure-source";
        url = "https://github.com/ros2-gbp/rig_reconfigure-release.git";
        rev = "5191a1c9c95be49357e3c27fd4d5061ba552770a";
        hash = "sha256-gZ+VV9GFmbsEaslar1+3aM0MYYc/PCvELyOWAiUPxHM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ocornut/imgui.git";
          to = "URL ${rig_reconfigure-vendor_source-imgui-0}";
        }
      ];
    };
    rig_reconfigure-vendor_source-imgui-0 = substituteSource {
      src = fetchgit {
        name = "rig_reconfigure-vendor_source-imgui-0-source";
        url = "https://github.com/ocornut/imgui.git";
        rev = "f8704cd085c4347f835c21dc12a3951924143872";
        hash = "sha256-eY8lRsonPfDRTMCPhInT9rQ6lSaJPsXpkh428OKpTnA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rig_reconfigure";
  version = "1.4.0-1";
  src = sources.rig_reconfigure;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ glfw3 rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
