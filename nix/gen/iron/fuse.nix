{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_doc,
  fuse_graphs,
  fuse_models,
  fuse_msgs,
  fuse_optimizers,
  fuse_publishers,
  fuse_variables,
  fuse_viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse = substituteSource {
      src = fetchgit {
        name = "fuse-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "8a1389e55e69f5a711320be20ea3336e10ea7c44";
        hash = "sha256-frVfLgKMTfhMq5hSbX0IeW5w+yQv+J9i9lZ6cKipwds=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse";
  version = "1.0.1-4";
  src = sources.fuse;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fuse_constraints fuse_core fuse_doc fuse_graphs fuse_models fuse_msgs fuse_optimizers fuse_publishers fuse_variables fuse_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
