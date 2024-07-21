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
        rev = "764dd93e29b143630f05b7e6396789c2967395f3";
        hash = "sha256-Zjjaom5lCGLMKC33kq6er1Ji54XUj/3hkSIWcBnXI+E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigen_stl_containers";
  version = "1.0.0-7";
  src = sources.eigen_stl_containers;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
