import canonicalLaneMathlib.AdmissibleClass
import BridgeLemmas
import GateLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure ManifoldWithBoundaryPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Type v
  boundary : Set manifold
  collarNeighborhood : Prop
  sobolevSpacesDefined : Prop
  traceMapExists : Prop

structure ManifoldWithBoundaryEvidence (P : ManifoldWithBoundaryPackage) where
  collarNeighborhoodClosed : P.collarNeighborhood
  sobolevSpacesDefinedClosed : P.sobolevSpacesDefined
  traceMapExistsClosed : P.traceMapExists

def ManifoldWithBoundaryClosed (P : ManifoldWithBoundaryPackage) : Prop :=
  P.collarNeighborhood ∧ P.sobolevSpacesDefined ∧ P.traceMapExists

theorem manifold_with_boundary_closed_from_evidence
    (P : ManifoldWithBoundaryPackage) (E : ManifoldWithBoundaryEvidence P) :
    ManifoldWithBoundaryClosed P := by
  exact And.intro E.collarNeighborhoodClosed
    (And.intro E.sobolevSpacesDefinedClosed E.traceMapExistsClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse