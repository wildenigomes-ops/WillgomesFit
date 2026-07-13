-- ═══════════════════════════════════════════════════════════════════════════
-- WILLGOMESFIT — Rode este script no Supabase → SQL Editor
-- Cria a tabela de feedbacks do aluno (elogios, problemas, pedidos de alteração)
-- ═══════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS portal_feedbacks (
  id uuid primary key default gen_random_uuid(),
  email text,
  user_id uuid,
  nome text,
  tipo text,              -- 'elogio' | 'problema' | 'alteracao'
  mensagem text,
  lida boolean default false,
  criado_em timestamptz default now()
);

ALTER TABLE portal_feedbacks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public_all_portal_feedbacks" ON portal_feedbacks
  FOR ALL USING (true) WITH CHECK (true);
