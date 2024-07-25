{
  boost_plugin_loader,
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  libyamlcpp,
  llvmPackages,
  pcl,
  python3Packages,
  ros_industrial_cmake_boilerplate,
  substituteSource,
}:
let
  sources = rec {
    reach = substituteSource {
      src = fetchgit {
        name = "reach-source";
        url = "https://github.com/ros2-gbp/reach-release.git";
        rev = "36d1ee8d158fc122621bd75070f6dc13c926fc30";
        hash = "sha256-+uOEQ0GsFTvN6B5Td+/Xi36Qe8fkzOCwmke7VrPHoJc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "reach";
  version = "1.6.0-1";
  src = sources.reach;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ boost_plugin_loader eigen libyamlcpp llvmPackages.openmp pcl python3Packages.boost ros_industrial_cmake_boilerplate ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
