{
  ament_cmake,
  ament_index_cpp,
  binutils,
  buildRosPackage,
  cppzmq,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  lz4,
  protobuf,
  python3Packages,
  qt5,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
  zstd,
}:
let
  sources = rec {
    plotjuggler = substituteSource {
      src = fetchgit {
        name = "plotjuggler-source";
        url = "https://github.com/ros2-gbp/plotjuggler-release.git";
        rev = "584dff9e7807fd7e16abb61c7202475935e1a4da";
        hash = "sha256-kQEuwq4UDS8HKavrfiAIiyeggpQApbcjeolB2GuG1KY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plotjuggler";
  version = "3.9.1-1";
  src = sources.plotjuggler;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ binutils cppzmq fastcdr lz4 protobuf python3Packages.boost qt5.qtbase qt5.qtsvg qt5.qtwebsockets qt5.qtx11extras rclcpp zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
