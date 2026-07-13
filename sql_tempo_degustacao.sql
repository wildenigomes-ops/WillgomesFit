-- ═══════════════════════════════════════════════════════════════════════════
-- WILLGOMESFIT — Rode este script no Supabase → SQL Editor
-- Habilita o controle de tempo de uso ativo da degustação (pausa/retoma)
-- ═══════════════════════════════════════════════════════════════════════════

ALTER TABLE leads_degustacao ADD COLUMN IF NOT EXISTS tempo_usado_ms bigint DEFAULT 0;
