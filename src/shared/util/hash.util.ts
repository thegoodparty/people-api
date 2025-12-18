import murmurhash from "murmurhash"

// This is fast, sub-ms
// For NON-cryptographic use
export function hash32(input: string): number {
  return murmurhash.v3(input)
}