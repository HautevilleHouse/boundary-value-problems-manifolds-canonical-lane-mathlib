import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure SobolevSpacePackage (M : Type) [TopologicalSpace M] [Manifold M] where
  sobolevNorm : Type
  traceMap : Type
  compactEmbedding : Prop

structure SobolevSpaceEvidence {M : Type} [TopologicalSpace M] [Manifold M] (S : SobolevSpacePackage M) where
  traceMapClosed : S.traceMap
  compactEmbeddingClosed : S.compactEmbedding

def SobolevSpaceClosed {M : Type} [TopologicalSpace M] [Manifold M] (S : SobolevSpacePackage M) : Prop :=
  S.traceMap ∧ S.compactEmbedding

theorem sobolev_space_closed_from_evidence {M : Type} [TopologicalSpace M] [Manifold M] (S : SobolevSpacePackage M) (E : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro E.traceMapClosed E.compactEmbeddingClosed

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse