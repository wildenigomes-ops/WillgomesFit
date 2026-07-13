-- ═══════════════════════════════════════════════════════════════════════════
-- WILLGOMESFIT — Rode este script no Supabase → SQL Editor
-- Habilita o modo "em atualização" para a degustação e para fichas de clientes
-- ═══════════════════════════════════════════════════════════════════════════

ALTER TABLE portal_fichas ADD COLUMN IF NOT EXISTS em_manutencao boolean DEFAULT false;
