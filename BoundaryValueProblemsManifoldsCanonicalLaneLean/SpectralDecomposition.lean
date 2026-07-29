import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsManifoldsCanonicalLaneLean.LaplaceBeltrami

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure SpectralDecompositionPackage {L : LaplaceBeltramiPackage} where
  eigenfunctions : ℕ → (L.manifold → ℝ)
  eigenvalues : ℕ → ℝ
  orthonormality : ∀ i j : ℕ, ∫ x : L.manifold, eigenfunctions i x * eigenfunctions j x = (if i = j then 1 else 0)
  completeness : ∀ f : L.manifold → ℝ, ∃ (c : ℕ → ℝ), f = Σ' i, c i * eigenfunctions i
  selfAdjointEigenvalue : ∀ i : ℕ, L.laplaceOperator (eigenfunctions i) = eigenvalues i * eigenfunctions i

structure SpectralDecompositionEvidence {L : LaplaceBeltramiPackage}
    (S : SpectralDecompositionPackage L) where
  orthonormalityClosed : ∀ i j : ℕ, ∫ x : L.manifold, S.eigenfunctions i x * S.eigenfunctions j x = (if i = j then 1 else 0)
  completenessClosed : ∀ f : L.manifold → ℝ, ∃ (c : ℕ → ℝ), f = Σ' i, c i * S.eigenfunctions i
  selfAdjointEigenvalueClosed : ∀ i : ℕ, L.laplaceOperator (S.eigenfunctions i) = S.eigenvalues i * S.eigenfunctions i

def SpectralDecompositionClosed {L : LaplaceBeltramiPackage}
    (S : SpectralDecompositionPackage L) : Prop :=
  (∀ i j : ℕ, ∫ x : L.manifold, S.eigenfunctions i x * S.eigenfunctions j x = (if i = j then 1 else 0)) ∧
  (∀ f : L.manifold → ℝ, ∃ (c : ℕ → ℝ), f = Σ' i, c i * S.eigenfunctions i) ∧
  (∀ i : ℕ, L.laplaceOperator (S.eigenfunctions i) = S.eigenvalues i * S.eigenfunctions i)

theorem spectral_decomposition_closed_from_evidence {L : LaplaceBeltramiPackage}
    (S : SpectralDecompositionPackage L) (E : SpectralDecompositionEvidence S) :
    SpectralDecompositionClosed S := by
  exact And.intro E.orthonormalityClosed
    (And.intro E.completenessClosed E.selfAdjointEigenvalueClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse