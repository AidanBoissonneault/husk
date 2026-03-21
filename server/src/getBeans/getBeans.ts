import { Router } from 'express'
import connection from '../db/connection.js'

const router = Router()

router.get('/', async (req, res) => {
  try {
    const query = `
    SELECT
    b.id,
    b.name,
    b.roaster,
    b.origin,
    b.variety,
    b.process,
    b.roast_level,
    b.elevation_m,
    b.status,
    b.created_at,
    b.flavour_summary,

    -- Primary note

    fn_pri.hue       AS pri_hue,
    cat_pri.chroma   AS pri_chroma,

    -- Secondary note
    fn_sec.hue       AS sec_hue,
    cat_sec.chroma   AS sec_chroma,

    -- Accent note
    fn_acc.hue       AS acc_hue,
    cat_acc.chroma   AS acc_chroma

  FROM beans b
  LEFT JOIN bean_palette bp       ON bp.bean_id      = b.id
  LEFT JOIN flavour_note fn_pri   ON fn_pri.id        = bp.pri_note
  LEFT JOIN flavour_note fn_sec   ON fn_sec.id        = bp.sec_note
  LEFT JOIN flavour_note fn_acc   ON fn_acc.id        = bp.acc_note
  LEFT JOIN category     cat_pri  ON cat_pri.id       = fn_pri.category_id
  LEFT JOIN category     cat_sec  ON cat_sec.id       = fn_sec.category_id
  LEFT JOIN category     cat_acc  ON cat_acc.id       = fn_acc.category_id

  WHERE b.user = ?
  ORDER BY b.created_at DESC;
  `
    const [rows] = await connection.query(query, 1)
    res.json(rows)
  } catch (err) {
    const error = err as Error
    console.log(error)
    res.status(500).json({ error: error.message })
  }
})

export default router
