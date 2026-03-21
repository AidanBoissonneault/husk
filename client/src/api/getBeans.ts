import type { CheckedJSON } from "@/types"

export const getBeans = async () => {
  try {
    const res = await fetch('/api/getbeans')
    if (!res.ok) throw new Error('Failed to fetch beans')
    const data = await res.json()
		return(<CheckedJSON>{ success: true, payload: data })
  } catch (err) {
		return(<CheckedJSON>{ success: false, error: err })
  }
}
