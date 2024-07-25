{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  openjdk,
  substituteSource,
}:
let
  sources = rec {
    nao_meshes = substituteSource {
      src = fetchgit {
        name = "nao_meshes-source";
        url = "https://github.com/ros-naoqi/nao_meshes-release.git";
        rev = "e8d7b4e0619aff4f096fb62215709caf9e200dbd";
        hash = "sha256-Q+VlNVGl0lTyoNdd3KPcp6q0IGBQ/3roQ/FxAzZLdCs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \${INSTALLER_URL}";
          to = "DOWNLOAD file://${nao_meshes-vendor_source-naomeshes-0-0}";
        }
      ];
    };
    nao_meshes-vendor_source-naomeshes-0-0 = substituteSource {
      src = fetchurl {
        name = "nao_meshes-vendor_source-naomeshes-0-0-source";
        url = "https://github.com/ros-naoqi/nao_meshes_installer/raw/master/naomeshes-0.6.7-linux-x64-installer.run";
        hash = "sha256-Fbr0YJue/KB7zGGV2bvcyMwxkFpQg1rtU4ajr8tF/1k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_meshes";
  version = "2.1.1-1";
  src = sources.nao_meshes;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openjdk ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
