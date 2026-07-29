import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure LaplaceBeltramiPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  metric : Type v
  laplaceOperator : Type w
  smoothness : Prop
  ellipticity : Prop
  selfAdjointness : Prop

structure LaplaceBeltramiEvidence (L : LaplaceBeltramiPackage) where
  smoothnessClosed : L.smoothness
  ellipticityClosed : L.ellipticity
  selfAdjointnessClosed : L.selfAdjointness

def LaplaceBeltramiClosed (L : LaplaceBeltramiPackage) : Prop :=
  L.smoothness ∧ L.ellipticity ∧ L.selfAdjointness

theorem laplace_beltrami_closed_from_evidence (L : LaplaceBeltramiPackage)
    (E : LaplaceBeltramiEvidence L) : LaplaceBeltramiClosed L := by
  exact And.intro E.smoothnessClosed (And.intro E.ellipticityClosed E.selfAdjointnessClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse