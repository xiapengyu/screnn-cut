import request from '@/utils/httpRequest'

export function createStorage (data) {
  return request({
    url: '/storage/create',
    method: 'post',
    data
  })
}

const uploadPath = process.env.BASE_API + 'sys/goods/uploadImage'
export { uploadPath }
