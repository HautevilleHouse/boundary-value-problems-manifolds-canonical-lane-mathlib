import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure SobolevPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  measure : manifold → ℝ
  sobolevNorm : (manifold → ℝ) → ℝ
  completeness : Prop
  compactEmbedding : Prop
  traceOperator : (manifold → ℝ) → (boundary → ℝ)

structure SobolevEvidence (S : SobolevPackage) where
  completenessClosed : S.completeness
  compactEmbeddingClosed : S.compactEmbedding

def SobolevClosed (S : SobolevPackage) : Prop :=
  S.completeness ∧ S.compactEmbedding

theorem sobolev_closed_from_evidence (S : SobolevPackage) (Ev : SobolevEvidence S) : SobolevClosed S := by
  exact And.intro Ev.completenessClosed Ev.compactEmbeddingClosed

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse