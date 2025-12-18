import murmurhash from "murmurhash"

export function hash32(input: string): number {
  return murmurhash.v3(input)
}