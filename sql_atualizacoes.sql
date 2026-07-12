-- ═══════════════════════════════════════════════════════════════════════════
-- WILLGOMESFIT — Rode este script UMA VEZ no Supabase → SQL Editor
-- Habilita: gênero no lead de degustação, fotos de progresso (antes/depois)
-- e o histórico de treinos concluídos (conquistas + resumo semanal)
-- ═══════════════════════════════════════════════════════════════════════════

-- 1) Gênero escolhido na degustação (para saber qual treino foi mostrado)
ALTER TABLE leads_degustacao ADD COLUMN IF NOT EXISTS genero text;

-- 2) Foto do registro de progresso (comparador antes/depois)
ALTER TABLE portal_progresso ADD COLUMN IF NOT EXISTS foto text;

-- 3) Histórico de treinos concluídos (base das conquistas e do resumo semanal)
CREATE TABLE IF NOT EXISTS portal_treino_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  email text,
  dia text,
  concluido_em timestamptz default now()
);

ALTER TABLE portal_treino_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public_all_treino_logs" ON portal_treino_logs
  FOR ALL USING (true) WITH CHECK (true);
