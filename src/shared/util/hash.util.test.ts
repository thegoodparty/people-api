import { describe, expect, it } from 'vitest'
import { hash32 } from './hash.util'

describe('hash32', () => {
  it('returns a number', () => {
    const result = hash32('test')
    expect(typeof result).toBe('number')
  })

  it('returns consistent results for same input', () => {
    const input = 'hello world'
    expect(hash32(input)).toBe(hash32(input))
  })

  it('returns different results for different inputs', () => {
    expect(hash32('foo')).not.toBe(hash32('bar'))
  })
})
