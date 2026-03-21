// ─────────────────────────────────────────
//  Bean Submit Form
// ─────────────────────────────────────────
export interface AddBeanForm {
	name: string
	roaster?: string
	origin?: string
	variety?: string
	process?: string
	roastLevel?: number
	state: BeanState
	flavourNotes?: string
}

type BeanState = "fresh" | "frozen" | "finished"

// ─────────────────────────────────────────
//  API sending type
// ─────────────────────────────────────────

export type CheckedJSON =
  | {
		success: true
		payload: JSON[]
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
