{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_map_server,
  mrpt_nav_interfaces,
  mrpt_pf_localization,
  mrpt_pointcloud_pipeline,
  mrpt_rawlog,
  mrpt_reactivenav2d,
  mrpt_tutorials,
  substituteSource,
}:
let
  sources = rec {
    mrpt_navigation = substituteSource {
      src = fetchgit {
        name = "mrpt_navigation-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "aa0ed81a67f905b59506a961de59368e0587d1ea";
        hash = "sha256-41PIEZUsBlzOkBCIqVxABdbgwHTPbeCVAeMtXdzbKGQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_navigation";
  version = "2.0.0-1";
  src = sources.mrpt_navigation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mrpt_map_server mrpt_nav_interfaces mrpt_pf_localization mrpt_pointcloud_pipeline mrpt_rawlog mrpt_reactivenav2d mrpt_tutorials ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
