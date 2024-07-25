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
        rev = "8184df538ae5511b986f456de7714dea3e1fab95";
        hash = "sha256-cKPuebcsUTKyXiLi21rSoKmAx7Csp2hKLgeXTpFwBEw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_navigation";
  version = "2.0.1-1";
  src = sources.mrpt_navigation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mrpt_map_server mrpt_nav_interfaces mrpt_pf_localization mrpt_pointcloud_pipeline mrpt_rawlog mrpt_reactivenav2d mrpt_tutorials ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
