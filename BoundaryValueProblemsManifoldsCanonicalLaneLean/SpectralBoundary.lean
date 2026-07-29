import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure SpectralBoundaryPackage {G : RiemannianCurvaturePackage} {B : BoundaryValueManifoldPackage G} (F : FredholmPackage (R : EllipticRegularityPackage B)) where
  laplacianSpectrum : Prop
  eigenfunctionExpansion : Prop
  traceClass : Prop

def SpectralBoundaryClosed {G : RiemannianCurvaturePackage} {B : BoundaryValueManifoldPackage G} {R : EllipticRegularityPackage B} (F : FredholmPackage R) (S : SpectralBoundaryPackage F) : Prop :=
  S.laplacianSpectrum ∧ S.eigenfunctionExpansion ∧ S.traceClass

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse