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

    -- Primary note
    fn_pri.note      AS pri_note,
    fn_pri.category  AS pri_category,
    fn_pri.hue       AS pri_hue,

    -- Secondary note
    fn_sec.note      AS sec_note,
    fn_sec.category  AS sec_category,
    fn_sec.hue       AS sec_hue,

    -- Accent note
    fn_acc.note      AS acc_note,
    fn_acc.category  AS acc_category,
    fn_acc.hue       AS acc_hue

    FROM beans b
    LEFT JOIN bean_palette bp    ON bp.bean_id  = b.id
    LEFT JOIN flavour_note fn_pri ON fn_pri.id  = bp.pri_note
    LEFT JOIN flavour_note fn_sec ON fn_sec.id  = bp.sec_note
    LEFT JOIN flavour_note fn_acc ON fn_acc.id  = bp.acc_note

    WHERE b.user = 1  -- swap out for your user id / param
    ORDER BY b.created_at DESC;
    `
    const [rows] = await connection.query(query)
    res.json(rows)
  } catch (err) {
    const error = err as Error
    console.log(error)
    res.status(500).json({ error: error.message })
  }
})

export default router
