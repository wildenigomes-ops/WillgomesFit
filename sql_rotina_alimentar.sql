-- ═══════════════════════════════════════════════════════════════════════════
-- WILLGOMESFIT — Rode este script no Supabase → SQL Editor
-- Adiciona o campo de rotina alimentar estruturada (refeições, alimentos,
-- calorias e substituições)
-- ═══════════════════════════════════════════════════════════════════════════

ALTER TABLE portal_fichas ADD COLUMN IF NOT EXISTS refeicoes_json jsonb;
