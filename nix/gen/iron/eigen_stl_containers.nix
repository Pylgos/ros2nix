{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    eigen_stl_containers = substituteSource {
      src = fetchgit {
        name = "eigen_stl_containers-source";
        url = "https://github.com/ros2-gbp/eigen_stl_containers-release.git";
        rev = "343c48f9c0e4efa4c357f9b8078f19bb8e89bf5a";
        hash = "sha256-Zjjaom5lCGLMKC33kq6er1Ji54XUj/3hkSIWcBnXI+E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigen_stl_containers";
  version = "1.0.0-6";
  src = sources.eigen_stl_containers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
