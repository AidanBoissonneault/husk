// ─────────────────────────────────────────
//  Bean Type
// ─────────────────────────────────────────
export interface Bean extends AddBeanForm {
	pri_note_hue?: number
	pri_note_chroma?: number
	sec_note_hue?: number
	sec_note_chroma?: number
	acc_note_hue?: number
	acc_note_chroma?: number
}

// ─────────────────────────────────────────
//  Bean State
// ─────────────────────────────────────────

type BeanState = "fresh" | "frozen" | "finished"

// ─────────────────────────────────────────
//  Bean Submit Form
// ─────────────────────────────────────────
export interface AddBeanForm {
	name: string
	roaster?: string
	origin?: string
	variety?: string
	process?: string
	elevation_m?: number
	roast_level?: number
	state: BeanState
	flavour_summary?: string
}

// ─────────────────────────────────────────
//  API sending type
// ─────────────────────────────────────────

export type CheckedJSON<T> =
  | {
		success: true
		payload: T
	} | {
		success: false
		error: string
	}

// ─────────────────────────────────────────
//  Tab Bar Button
// ─────────────────────────────────────────
export interface TabButton {
	icon: string
	text: string
	route: string
}
